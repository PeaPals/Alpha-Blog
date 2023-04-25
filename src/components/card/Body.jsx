export function CardBody({cardTitle, cardText, additionalComponent}) {

    return (

        <div class='card-body'>
            <h5 className='card-title'>{cardTitle}</h5>
            <p class='card-text'>{cardText}</p>
            <br/>

            {additionalComponent && <additionalComponent/>}
        </div>

    )
}
