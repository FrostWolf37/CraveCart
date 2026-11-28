# Capstone Project

## **Names**: Dan and Zach
### **Original Authors**: Vanshika and Emma

## Database Rationale

To replace the inherited project's temporary in-memory array, we connected CraveCart to a SQLite database using a single `stock` table. Every item in our grocery store shares the exact same basic details—an auto-incrementing `id`, `name`, `category`, `quantity`, `price`, `image` path, and `alt` text. Storing all 35 seeded products in one `stock` table keeps our Express `/api/products` queries simple and fast without needing extra table joins just to load `ProductList` or `ProductDetail`.

The main trade-off we made in our database design was choosing strict data validation over flexibility. In `groceryList.sql`, we set `NOT NULL` rules on our required columns along with SQL `CHECK` constraints that limit `category` to seven specific grocery aisles (`Fruits`, `Vegetables`, `Dairy`, `Bakery`, `Meat & Seafood`, `Beverages`, and `Snacks`) and prevent `quantity` from ever going below zero (`quantity >= 0`). Putting these rules straight into the database guarantees that bad data gets blocked even if something slips past the front-end form validation in `ProductForm`. The downside is that adding a new grocery aisle later on isn't as simple as typing it into the app—we would have to update the `CHECK` constraint in our table schema first.

Overall, backing a single `stock` table with SQLite gives CraveCart reliable persistence across server restarts while keeping the database easy to understand, test, and reset during development.

## **Project Description**:

For this project, our idea is to create a grocery store and manage its inventory that stores the following data:

- Stores the different food groups.
- The quantity of each item.
- The price of each item.

## **Technical Reflection**:

We have used landmarks that match the content structure (header with nav, one main with four sections and a footer). Headings go h1 to h2 with no gaps in the hierarchy and each product is an article with the product name as the h3. Each control has a visible label with the appropriate for/id. ARIA is used only where there is a gap in the native semantics (role="status" on the result count and welcome message to announce the updates and role="search" on the filter form). The product images have their alt text taken from the per product field in the data rather than just using the product name so the alt text is specific to the image. As the cards are created dynamically with javaScript we set the alt text when the image is created rather than after the element has been inserted into the DOM so every image in the page has a description. The end result is a page where a screen reader user can jump around the landmarks, navigate through headings and hear every form field announced with its meaningful description.

Flexbox is the tool for one dimensional flows where the size of the content is what drives the layout. That's the header (logo on the left, nav on the right, wrapping at the narrow screen breakpoint), the nav list and the stacked label/input pairs in the forms. Grid is the tool for two dimensional layouts where you want to define your tracks first. The product list uses a repeat style of column tracks that goes from 1 to 2 to 3 columns at the tablet and desktop breakpoints. A flex-wrap approach would leave the items in the final row of that list with very uneven sizing whereas fixed grid tracks ensure that every card is aligned. The price class uses float to push the text to the right side of the screen whilst staying on the same line as quantity. The cards image section centers the image and sets it to automatically choose the height based on the user's screen. The tablet main is also a grid with the search and login side by side and the products and about taking up the full width with grid-column: 1 / -1.

Challenge: Our main layout roadblock hit at the tablet breakpoint: positioning the "#look-up" (search) and "#log-in" forms side-by-side. Initially, we tried applying CSS alignment properties directly to internal form controls. However, this only shifted child labels and inputs while leaving parent headings anchored on the left, causing visual misalignment between forms and their headers.We resolved this by shifting grid context to the parent container. By declaring main as a two-column CSS Grid at the tablet media query, we placed #look-up in column 1 and #log-in in column 2. Treating whole section elements as grid items ensured headings and form elements moved as unified blocks, while subsequent full-width sections used grid-column: 1 / -1 to span across both columns smoothly.

# CraveCart: one endpoint, one component

For this project, you will need 2 terminals to run the full backend.

## Running the API (terminal 1)

    cd server
    npm install
    npm start          # http://localhost:3001/api/products

## Running the React app (terminal 2)

    cd client
    npm install
    npm run dev        # http://localhost:5173
