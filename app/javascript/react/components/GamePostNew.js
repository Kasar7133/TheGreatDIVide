import React, { useState } from "react"
import AsyncSelect from 'react-select/async'


const GamePostNew = (props) => {
    const [fetched, setFetched] = useState(false)
    const [gameName, setGameName] = useState("")
    const [teamName, setTeamName] = useState("")
    const [teamNotes, setTeamNotes] = useState("")

    const playerLimit = []
    const changeHandler = event =>{
        setGameName(event)
    }

    const teamHandler = event =>{
        setTeamName(event.currentTarget.value)
    }

    const notesHandler = event =>{
        setTeamNotes(event.currentTarget.value)
    }

    const fetchGame = async (event) => {
        try {
            const response = await fetch(`../api/v1/games`)
            if (!response.ok) {
            const errorMessage = `${response.status} (${response.statusText})`
            const error = new Error (errorMessage)
            throw(error)
        }
        return(response.json().then((dataJSON)=>
            dataJSON.filter((game)=>game.title.includes(gameName))
        ))
        

    } catch (error) {
        console.error(`Error in fetch: ${error.message}`)
        }
    }

    if (fetched===false){
    fetchGame()
    setFetched(true)
    } 

    return(
        <div>

            <label htmlFor="new_game_post" className="form-labels sessions wisteria" >Select a Game:</label>
            <AsyncSelect
                cacheOptions
                className="form-labels text-field"
                placeholder="Type a game name"
                id="new_game_post"
                getOptionLabel={(result) => result.title}
                getOptionValue={(result) => result.title}
                loadOptions={fetchGame}
                onInputChange={changeHandler}
            />
            <label htmlFor="team_name" className="form-labels sessions wisteria">Team Name:</label>
            <input id="team_name" type="text" onChange={teamHandler} className="form-labels text-field"></input>

            <label htmlFor="requested_player_number" className="form-labels sessions wisteria">Number of players you need:</label>
            <select name="requested_player_number" id="requested_player_number"  className="form-labels text-field">
                <option value="">-</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
            </select>

            <label htmlFor="description" className="form-labels sessions wisteria">Team Notes:</label>
            <input id="description" type="text" onChange={notesHandler} className="form-labels text-field"></input>

            <input type="submit" value="Request Team" className="button new-success"/>
        </div>
    )
}

export default GamePostNew