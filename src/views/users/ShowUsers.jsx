import { useState } from "react";
import { GridView } from "../../components/gridview";
import { UserCard } from "./UserCard";
import React from "react";
import axios from "axios";

export function ShowUsers() {
  const [allUsers, setAllUsers] = useState([]);

  // React.useEffect(() => {
  //   axios.get("http://localhost:3000/users").then((response) => {
  //     setAllUsers(response.data.allUsers);
  //     console.log(response);
  //   });
  // }, []);

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
