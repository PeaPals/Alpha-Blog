import { Link } from "react-router-dom";
import { ArticleCard } from "./ArticleCard";

export function ShowArticle({ article }) {
  return (
    <div id="page-content">
      <h1 className="text-center mt-4">{article.title}</h1>
      <div className="container">
        <ArticleCard article={article} />

        <Link
          to="/articles"
          className="btn btn-outline-primary btn-lg btn-block col-12"
        >
          Return
        </Link>
      </div>
    </div>
  );
}
