export function Error({ errorName, errorMessages }) {
  return (
    <div className="alert alert-danger" role="alert">
      <h4 className="alert-heading">
        Following errors prevented {errorName} from saving
      </h4>
      <ul>
        {errorMessages.map((msg) => (
          <li id={msg}>{msg}</li>
        ))}
      </ul>
    </div>
  );
}
