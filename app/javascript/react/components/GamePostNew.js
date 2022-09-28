import React, { useState } from "react"
import AsyncSelect from 'react-select/async'

const GamePostNew = (props) => {
    const [fetched, setFetched] = useState(false)
    const [gameName, setGameName] = useState("")

    const changeHandler = event =>{
        setGameName(event)
    }

    const fetchGame = async (event) => {
        // try {
        //     const response = await fetch(`../api/v1/games`)
        //     if (!response.ok) {
        //     const errorMessage = `${response.status} (${response.statusText})`
        //     const error = new Error (errorMessage)
        //     throw(error)
        // }
        
        return(fetch(`../api/v1/games`).then((data)=>data.json()).then((dataJSON)=>{
            dataJSON.filter((game)=>game.title.includes())
        }))
        

    // } catch (error) {
    //     console.error(`Error in fetch: ${error.message}`)
    //     }
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
                onChange={changeHandler}
            />
        </div>
    )

}

export default GamePostNew