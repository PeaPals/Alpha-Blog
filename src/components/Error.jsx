export function Error({
    errorName,
    errorMessages
}) {
    return (
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">Following errors prevented {errorName} from saving</h4>
            <ul>
                {errorMessages.map((msg) => <li id={msg}>{msg}</li>)}
            </ul>
        </div>
    )
}
