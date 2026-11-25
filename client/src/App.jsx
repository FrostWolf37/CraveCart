import { Link, Route, Routes } from "react-router";
import ProductList from "./pages/ProductList.jsx";
import ProductDetail from "./pages/ProductDetail.jsx";
import ProductForm from "./pages/ProductForm.jsx";
import './styles.css';

export default function App() {
  return (
    <>
		<meta charSet="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>CraveCart</title>
		<link rel="stylesheet" href="./styles.css" />
    <header>
		<h1>
			<img src="images/CraveCart.png" alt="CraveCart Logo" className="logo" />
		</h1>
		<nav>
			<ul>
			<li>
				<a href="#look-up">Search</a>
			</li>
			<li>
				<a href="#log-in">Account</a>
			</li>
			<li>
				<a><Link to="/">Products</Link></a>
			</li>
			<li>
				<a href="#about">About</a>
			</li>
		</ul>
	</nav>
      </header>
      <main>
		<>
  <div className="top-section">
    <section id="look-up">
      <h2>Craving something?</h2>
      <form className="controls" role="search">
        <div className="field">
          <label htmlFor="search">Search by name</label>
          <input id="search" type="search" placeholder="e.g., bananas" />
        </div>
        <div className="field">
          <label htmlFor="category">Category</label>
          <select id="category">
            <option value="All">All</option>
            <option value="Fruits">Fruits</option>
            <option value="Vegetables">Vegetables</option>
            <option value="Dairy">Dairy</option>
            <option value="Bakery">Bakery</option>
            <option value="Meat & Seafood">Meat &amp; Seafood</option>
            <option value="Beverages">Beverages</option>
            <option value="Snacks">Snacks</option>
          </select>
        </div>
      </form>
    </section>
    <section className="login" id="log-in">
      <h2>Sign in</h2>
      <form className="login-form">
        <div className="field">
          <label htmlFor="username">Username</label>
          <input
            id="username"
            type="text"
            placeholder="example@example.com"
            autoComplete="username"
            required=""
          />
        </div>
        <div className="field">
          <label htmlFor="password">Password</label>
          <input
            id="password"
            type="password"
            autoComplete="current-password"
            required=""
          />
        </div>
        <button type="submit">Log in</button>
      </form>
      <p id="welcome" role="status" />
    </section>
  </div>
	<nav><Link to="/products/new">Add a product</Link></nav>
</>
        <Routes>
          <Route path="/" element={<ProductList />} />
          <Route path="/products/new" element={<ProductForm />} />
          <Route path="/products/:id" element={<ProductDetail />} />
          <Route path="/products/:id/edit" element={<ProductForm />} />
        </Routes>
	<section id="about">
    	<h2>About</h2>
    	<p>CraveCart is a mock grocery store site.</p>
  	</section>
      </main>
	<footer className="site-footer">
		<p>CSC 3050</p>
	</footer>

    </>
  );
}