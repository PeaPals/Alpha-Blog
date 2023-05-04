import { Link } from "react-router-dom";

export function ArticleCard({ article }) {
  return (
    <div className="container">
      <div className="card text-center shadow p-3 mb-5 bg-white rounded">
        {/* Header */}
        <div className="card-header">
          Created By:{" "}
          <Link
            to={`/users/${article.user_id}`}
            style={{ textDecoration: "none" }}
          >
            {article.user_username}
          </Link>
        </div>

        {/* Body */}
        <div className="card-body">
          <p className="card-text">{article.description}</p>
        </div>

        {/* Title */}
        <div className="card-footer text-muted">{article.createdBy}</div>
      </div>
    </div>
  );
}
