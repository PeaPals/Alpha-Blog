import "./shared.css";
import { HomeFooter } from "./footer";
import { Link } from "react-router-dom";

export function Home({ signedIn = true }) {
  return (
    <>
      <div className="container" id="home-container">
        <div className="text-center text-white" id="home-headings">
          <h1
            className="display-4 text-white fw-bold"
            style={{ fontSize: "46px" }}
          >
            Welcome to Alpha-Blog
          </h1>
          <p
            className="lead fw-bold"
            style={{ color: "slategray", fontStyle: "italic" }}
          >
            The world lives here
          </p>

          {signedIn && (
            <Link
              to="/articles?show=my-feed"
              className="btn btn-outline-info btn-lg fw-bold"
            >
              My Feed
            </Link>
          )}
          {!signedIn && (
            <Link
              to="new_user_registration_path"
              className="btn btn-outline-info btn-lg fw-bold"
            >
              Get Started
            </Link>
          )}
        </div>
      </div>

      <HomeFooter footerText="Made by @neonklr" />
    </>
  );
}
