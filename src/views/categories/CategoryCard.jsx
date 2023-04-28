export function CategoryCard({ category }) {
  return (
    <div className="container">
      <div className="card text-center shadow p-3 mb-5 bg-white rounded">
        {/* Header */}
        <div className="card-header">{category.title}</div>

        {/* Body */}
        <div className="card-body">
          <h5 className="card-title">{category.title}</h5>
          <p className="card-text">{category.description}</p>
        </div>

        {/* Title */}
        <div className="card-footer text-muted">{category.createdBy}</div>
      </div>
    </div>
  );
}
