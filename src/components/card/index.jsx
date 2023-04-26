import { CardHeader } from './Header';
import { CardFooter } from './Footer';
import { CardBody } from './Body';


export function Card({
    cardHeader,
    cardFooter,
    cardTitle,
    cardText,
    AdditionalComponent,
    children
}) {
    return (
        <div className="container">
            <div className="card text-center shadow p-3 mb-5 bg-white rounded">
                <CardHeader headerText={cardHeader} />
                <CardBody cardTitle={cardTitle} cardText={cardText}>{children}</CardBody>
                <CardFooter footerText={cardFooter} />
            </div>
        </div>
    )
}
