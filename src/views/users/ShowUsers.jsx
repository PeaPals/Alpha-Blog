import { GridView } from "../../components/gridview"

export function ShowUsers() {
    const allUsers = []

    return (
        <div id="page-content">
            <h1 className="text-center mt-4">Alpha Bloggers</h1>
            <br />

            <GridView list={allUsers} columns={3}/>
        </div>
    )
}
