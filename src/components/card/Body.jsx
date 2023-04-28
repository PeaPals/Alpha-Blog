export function CardBody({ cardTitle, cardText, children }) {
  return (
    <div className="card-body">
      <h5 className="card-title">{cardTitle}</h5>
      <p className="card-text">{cardText}</p>
      <br />

      {children}
    </div>
  );
}
