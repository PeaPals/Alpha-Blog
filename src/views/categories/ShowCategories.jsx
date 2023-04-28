import { GridView } from "../../components/gridview";
import { CategoryCard } from "./CategoryCard";

export function ShowCategories() {
  const allCategories = [];

  return (
    <div id="page-content">
      <h1 className="text-center mt-4">Listing All Categories</h1>
      <br />

      <GridView columns={3}>
        {allCategories.map((category) => (
          <div className="col" key={category.name}>
            <CategoryCard category={category} />
          </div>
        ))}
      </GridView>
    </div>
  );
}
