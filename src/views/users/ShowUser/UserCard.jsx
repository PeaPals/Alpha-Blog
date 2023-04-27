export function UserCard({
    id,
    gender,
    assetPath,
    username
}) {


    return (
        <div class="card shadow-lg p-3 mb-5 bg-white rounded">
            <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                    <img
                        className="rounded-circle"
                        alt="Profile-Image"
                        width={150}
                        src={`https://xsgames.co/randomusers/avatar.php?g=${gender}&id=${id}`}
                        // TODO : onError={() => {this.src = assetPath;}}
                    />

                    <div class="mt-3">
                        <h4>{username}</h4>
                        <p class="text-secondary mb-1" style={{margin: "10px"}}>Alpha Blogger</p>
                    </div>
                </div>
            </div>
        </div>
    )
}
