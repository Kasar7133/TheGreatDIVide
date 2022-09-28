import React, { useEffect, useState } from "react"
import { Redirect } from "react-router-dom"
import AsyncSelect from 'react-select/async'


const NewGamePage = (props) => {
    const [gameName, setGameName] = useState("")
    const [redirect, setRedirect] = useState(false)
    // gameName has search data
    const changeHandler = event =>{
        setGameName(event.name)
    }

    const searchHandler = event =>{
        testSearch(event)  
    }
    // fetch can use API given function in backend


    const testSearch = async search =>{
        try{

            const response = await fetch(`/api/v1/searches`,{
                credentials: "same-origin",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({searchData: search})
            })
            return response.json()


        }
        catch(error) {
        console.log(`Error in fetch: ${error}`)
    }

    }

    const postGame = async event =>{
        event.preventDefault()
        try {
            const response = await fetch(`/api/v1/games`, {
            credentials: "same-origin",
            method: "POST",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: JSON.stringify({name: gameName})
          })

            if (!response.ok) {
            const errorMessage = `${response.status} (${response.status.text})`
            const error = new Error(errorMessage)
            throw(error)
        }
        setRedirect(true)        
        } catch(error) {
            console.log(`Error in fetch: ${error}`)
        }

    }
    if (redirect){
        return <Redirect to="/game_posts/new"/>
    }

    return (
        <form>
            <div>
                <label htmlFor="game_name" className="form-labels sessions wisteria" >Select a Game:</label>
                <AsyncSelect
                cacheOptions
                className="form-labels text-field"
                id= "game_name"
                placeholder="Type a game name"
                getOptionLabel={(result) => result.name}
                getOptionValue={(result) => result.name}
                loadOptions={testSearch}
                onInputChange={searchHandler}
                onChange={changeHandler}
                />
                
                <input onClick={postGame} type="submit" value="Add Game" className="button new-success" />
            </div>
        </form>
    )
}

export default NewGamePage