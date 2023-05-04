import { useState } from "react";
import React from "react";
import axios from "axios";
import { Link } from "react-router-dom";

export function UserCard({ user }) {
  const [currentUser, setCurrentUser] = useState(false);
  const gender = user.id % 2 ? "male" : "female";

  return (
    <div className="container">
      <div className="card text-center shadow p-3 mb-5 bg-white rounded">
        {/* Header */}
        <div className="card-header">
          {currentUser.id === user.id && (
            <>
              <button className="btn btn-sm btn-info fw-bold">You</button>
            </>
          )}

          {!(currentUser.id === user.id) && (
            <>
              <button className="btn btn-warning btn-sm fw-bold">
                Follow(ing) ?
              </button>
            </>
          )}
        </div>

        {/* Body */}
        <div className="card-body">
          <img
            src={`https://xsgames.co/randomusers/avatar.php?g=${gender}&id=${user.id}`}
            alt="Profile Image"
            class="rounded-circle"
            width="150"
            style={{ marginTop: "15px", marginBottom: "15px" }}
          />
          <h5 className="card-title">{user.username}</h5>
          <div class="text-secondary" style={{ fontStyle: "italic" }}>
            Joined at : {user.created_at}{" "}
          </div>

          <div
            class="row"
            style={{ alignItems: "flex-end", marginTop: "1.5rem" }}
          >
            <Link
              to={`/users/${user.id}?show=articles`}
              className="btn btn-md btn-light col-4"
              style={{ overflowWrap: "normal" }}
            >
              4 ?
            </Link>

            <Link
              to={`/users/${user.id}?show=followers`}
              className="btn btn-md btn-light col-4"
              style={{ overflowWrap: "normal" }}
            >
              5 ?
            </Link>

            <Link
              to={`/users/${user.id}?show=following`}
              className="btn btn-md btn-light col-4"
              style={{ overflowWrap: "normal" }}
            >
              6 ?
            </Link>
          </div>

          <Link
            to={`/users/${user.id}`}
            className="btn btn-outline-primary btn-md"
            style={{ marginTop: "1rem" }}
          >
            Show Profile
          </Link>
        </div>
      </div>
    </div>
  );
}
