import React, { useState } from "react"
import AsyncSelect from 'react-select/async'
import Select from 'react-select'


const GamePostNew = (props) => {
    const [fetched, setFetched] = useState(false)
    const [gameName, setGameName] = useState("")
    const [postInfo, setPostInfo] = useState({
        game_title:"",
        requested_number_of_players: null,
        description:"",
        team_name:""
    })
    
    const limitList = [{value:1,label:"1"},
    {value:2,label:"2"},
    {value:3,label:"3"},
    {value:4,label:"4"},
    {value:5,label:"5"},
    {value:6,label:"6"},
    {value:7,label:"7"}]
    
    const changeHandler = event =>{
        setGameName(event)
    }

    const teamHandler = event =>{
        setPostInfo({...postInfo, team_name: event.currentTarget.value})
    }

    const notesHandler = event =>{
        setPostInfo({...postInfo, description: event.currentTarget.value})
    }
    console.log(postInfo)
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
    
    const gameChanger = (event) =>{
        setPostInfo({...postInfo, game_title: event.title})
    }

    const playerChanger = (event) =>{
        setPostInfo({...postInfo, requested_number_of_players: event.value})
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
                onChange={gameChanger}
                onInputChange={changeHandler}
            />
            <label htmlFor="team_name" className="form-labels sessions wisteria">Team Name:</label>
            <input id="team_name" type="text" onChange={teamHandler} className="form-labels text-field"></input>

            <label htmlFor="requested_player_number" className="form-labels sessions wisteria">Number of players you need:</label>
            <Select
            className="form-labels text-field"
            placeholder="Select # of players"
            options={limitList}
            onChange={playerChanger}
            />

            <label htmlFor="description" className="form-labels sessions wisteria">Team Notes:</label>
            <input id="description" type="text" onChange={notesHandler} className="form-labels text-field"></input>

            <input type="submit" value="Request Team" className="button new-success"/>
        </div>
    )
}

export default GamePostNew