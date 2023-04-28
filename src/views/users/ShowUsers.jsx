import { GridView } from "../../components/gridview";
import { UserCard } from "./UserCard";

export function ShowUsers() {
  const allUsers = [];

  return (
    <div id="page-content">
      <h1 className="text-center mt-4">Alpha Bloggers</h1>
      <br />

      <GridView columns={3}>
        {allUsers.map((user) => (
          <div className="col" key={user.name}>
            <UserCard user={user} />
          </div>
        ))}
      </GridView>
    </div>
  );
}
