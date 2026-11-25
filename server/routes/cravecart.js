// Routing only: translate HTTP into calls to the store, and results into status codes.
import { Router } from "express";
import prisma from '../db.js';
import * as store from "../services/craveStore.js";

const router = Router();

const notFound = id => ({ error: { code: "NOT_FOUND", message: `No product with id ${id}` } });
const invalid = details => ({ error: { code: "VALIDATION_FAILED", message: "The product is not valid", details } });

// An id must be written as a positive whole number, e.g., "3", but not "3.0", "03", or "abc".
// Anything else becomes null, which matches no product, so the route answers 404.
const toId = text => (/^[1-9][0-9]*$/.test(text) ? Number(text) : null);

const fields = body =>
  Object.fromEntries(
    ["name", "category", "quantity", "price", "image", "alt"]
      .filter(key => body[key] !== undefined)
      .map(key => [key, body[key]])
);

// GET /api/products: 200 and the list
router.get("/", async (req, res, next) => {
  try {
    res.status(200).json(await prisma.stock.findMany());
  } catch (err) {
    next(err);
  }
});

// GET /api/products/:id: 200 and the product, or 404
router.get("/:id", async (req, res, next) => {
  try {
    const id = toId(req.params.id);
    const product = id && (await prisma.stock.findUnique({ where: { id } }));
    if (!product) return res.status(404).json(notFound(req.params.id));
    res.status(200).json(product);
  } catch (err) {
    next(err);
  }
});

// POST /api/products: 201 and the created product, or 400
router.post("/", async (req, res, next) => {
  try {
    const problems = store.validate(req.body);
    if (problems.length > 0) return res.status(400).json(invalid(problems));
    const created = await prisma.stock.create({ data: fields(req.body) });
    res.status(201).json(created);
  } catch (err) {
    next(err);
  }
});

// PUT /api/products/:id: 200 and the updated product, 400, or 404
router.put("/:id", async (req, res, next) => {
  try {
    const problems = store.validate(req.body);
    if (problems.length > 0) return res.status(400).json(invalid(problems));
    const id = toId(req.params.id);
    if (!id) return res.status(404).json(notFound(req.params.id));
    const updated = await prisma.stock.update({ where: { id }, data: fields(req.body) });
    res.status(200).json(updated);
  } catch (err) {
    if (err.code === "P2025") return res.status(404).json(notFound(req.params.id)); // no such row
    next(err);
  }
});

// DELETE /api/products/:id: 204 with no body, or 404
router.delete("/:id", async (req, res, next) => {
  try {
    const id = toId(req.params.id);
    if (!id) return res.status(404).json(notFound(req.params.id));
    await prisma.stock.delete({ where: { id } });
    res.status(204).end();
  } catch (err) {
    if (err.code === "P2025") return res.status(404).json(notFound(req.params.id));
    next(err);
  }
});

export default router;