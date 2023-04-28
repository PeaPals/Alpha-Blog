import { GridView } from "../../components/gridview";

export function ShowArticles() {
  const allArticles = [];

  return (
    <div id="page-content">
      <h1 className="text-center mt-4">Listing Articles</h1>
      <br />

      <GridView list={allArticles} columns={3} />
    </div>
  );
}
