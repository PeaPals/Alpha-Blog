import { Link } from "react-router-dom";


export function CategoryForm({
    name,
    setName,
    onSubmit
}) {

    return (
        <form>

            <div className="form-group row" style={{margin: "10px"}}>
                <label className="col-2 col-form-label">Name</label>
                <div className="col-9">
                    <input type="text" className="form-control" value={name} onChange={(e) => setName(e.target.value)} placeholder="Category Name"></input>
                    <small className="form-text text-muted">Must be 6-100 characters long.</small>
                </div>
            </div>

            <div className="form-group row" style={{margin: "10px"}}>
                <div className="col-2"></div>
                <div className="col"><button type="button" onClick={onSubmit} className="btn btn-outline-success btn-block w-100">Submit</button></div>
                <div className="col"><Link to="/categories" className="btn btn-outline-danger w-100">Cancel</Link></div>
                <div className="col-1"></div>
            </div>
        </form>
    )
}
