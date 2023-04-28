export function ArticleCard({ article }) {
  return (
    <div className="container">
      <div className="card text-center shadow p-3 mb-5 bg-white rounded">
        {/* Header */}
        <div className="card-header">{article.title}</div>

        {/* Body */}
        <div className="card-body">
          <h5 className="card-title">{article.title}</h5>
          <p className="card-text">{article.description}</p>
        </div>

        {/* Title */}
        <div className="card-footer text-muted">{article.createdBy}</div>
      </div>
    </div>
  );
}
