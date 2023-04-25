import { CardHeader } from './header';
import { CardFooter } from './footer';
import { CardBody } from './body';


export function Card({
    cardHeader,
    cardFooter,
    cardTitle,
    cardText,
    additionalComponent
}) {
    return (
        <div className="container">
            <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                <CardHeader headerText={cardHeader} />
                <CardBody cardTitle={cardTitle} cardText={cardText} additionalComponent={additionalComponent} />
                <CardFooter footerText={cardFooter} />
            </div>
        </div>
    )
}
