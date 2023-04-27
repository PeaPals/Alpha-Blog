import { GridView } from "../../components/gridview"

export function ShowCategories() {
    const allCategories = []

    return (
        <div id="page-content">
            <h1 class="text-center mt-4">Listing All Categories</h1>
            <br />

            <GridView list={allCategories} columns={3}/>
        </div>
    )
}
