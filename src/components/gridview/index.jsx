import { Card } from "../card";

export function GridView({ list, columns = 3 }) {
  return (
    <div className="container">
      <div className={`row row-cols-${columns}`}>
        {list.map((object) => (
          <div className="col" key={object.title}>
            <Card
              cardHeader={object.header}
              cardTitle={object.title}
              cardText={object.text}
              cardFooter={object.footer}
            >
              {object.additionalComponent}
            </Card>
          </div>
        ))}
      </div>
    </div>
  );
}
