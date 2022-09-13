import React, { useEffect, useState } from "react"

const NewGamePage = (props) => {
    const [gameName, setGameName] = useState("")
    
    const changeHandler = event =>{
        setGameName(event.currentTarget.value)
    }

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
                <input type="submit" value="Add Game" className="button new-success" />
            </div>
        </form>
    )
}

export default NewGamePage