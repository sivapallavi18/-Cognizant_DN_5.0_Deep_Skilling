import React from 'react';
import CohortDetails from './components/CohortDetails';
function App() {
    const cohorts = [
        {
            cohortName: "INTADMDF10 .NET FSD",
            startDate: "22-Feb-2022",
            status: "Scheduled",
            coach: "Aathma",
            trainer: "Jojo Jose"
        },
        {
            cohortName: "ADM21JF014 -Java FSD",
            startDate: "10-Sep-2021",
            status: "ongoing",
            coach: "Apoorv",
            trainer: "Elise Smith"
        },
        {
            cohortName: "CDBJF21025 -Java FSD",
            startDate: "10-Sep-2021",
            status: "ongoing",
            coach: "Aathma",
            trainer: "John Doe"
        }

    ];
    return (
        <div>
            {cohorts.map((cohort, index) => (
                <CohortDetails
                    key={index}
                    cohort={cohort}
                />
            ))}
        </div>
    );
}
export default App;