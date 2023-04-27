export function Message({
    list
}) {


    return (
        <>
            {
                list.map(({type, msg}) => (
                    <div class={`alert alert-${type} alert-dismissible fade show`} role="alert" style={{textAlign: "center"}}>
                        <strong></strong>{msg}

                        {/* TODO <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button> */}
                    </div>
                ))
            }
        </>
    )
}
