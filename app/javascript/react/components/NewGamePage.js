import React, { useEffect, useState } from "react"
import { Redirect } from "react-router-dom"


const NewGamePage = (props) => {
    const [gameName, setGameName] = useState("")
    // const [redirect, setRedirect] = useState(false)
    


    const changeHandler = event =>{
        setGameName(event.currentTarget.value)
    }

    // useEffect(() => {
    //     gameName
    // }, [])


    const postGame = async (event) =>{
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
        // setRedirect(true)        
        } catch(error) {
            console.log(`Error in fetch: ${error}`)
        }

    }
    // if (redirect){
    //     debugger
    //     return <Redirect to="/game_posts/new/reload"/>
    // }

    return (
        <form>
            <div>
                <label htmlFor="game_name" className="form-labels sessions wisteria" >Game Title:</label>
                <input
                className="form-labels text-field"
                id= "game_name"
                type="text"
                value={gameName}
                onChange={changeHandler}
                />
                <input onClick={postGame} type="submit" value="Add Game" className="button new-success" />
            </div>
        </form>
    )
}

export default NewGamePage