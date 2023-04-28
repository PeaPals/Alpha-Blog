export function UserCard({ user }) {
  return (
    <div className="container">
      <div className="card text-center shadow p-3 mb-5 bg-white rounded">
        {/* Header */}
        <div className="card-header">{user.name}</div>

        {/* Body */}
        <div className="card-body">
          <h5 className="card-title">{user.email}</h5>
          <p className="card-text">{user.email}</p>
        </div>

        {/* Title */}
        <div className="card-footer text-muted">{user.joinedAt}</div>
      </div>
    </div>
  );
}
