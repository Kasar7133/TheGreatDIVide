import React, { useEffect, useState } from "react"

// too many players  
// registrants not appearing on page after refresh 

const GamePostShowPage = (props) => {
    const [game, setGame] = useState({
        players: []
    })
    const [currentUser, setCurrentUser] = useState({})
    
    useEffect(() => {
        fetchGame()
    }, [])

    const fetchGame = async () => {
        try {
          const response = await fetch(`/api/v1/game_posts/${props.match.params.id}`)
          if (!response.ok) {
            const errorMessage = `${response.status} (${response.statusText})`
            const error = new Error (errorMessage)
            throw(error)
          }
          const gameData = await response.json()

          setGame(gameData.session)
          setCurrentUser(gameData.current_user)
        } catch (error) {
          console.error(`Error in fetch: ${error.message}`)
        }
    }



    const postPlayer = async () =>{
        try {
            const response = await fetch(`/api/v1/game_posts/${props.match.params.id}/registrations`, {
            credentials: "same-origin",
            method: "POST",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: JSON.stringify({players: game.user})
          })

            if (!response.ok) {
            const errorMessage = `${response.status} (${response.status.text})`
            const error = new Error(errorMessage)
            throw(error)
          }
            //   replace this logic with:
            //   get the current user and add that player t
            let existingPlayer = false

            game.players.forEach((player)=>{
                if (player.username === currentUser.username){
                    existingPlayer = true
                }
            })

            if(existingPlayer === false){
                setGame({...game, players: game.players.concat(currentUser)})
            }


        } catch(error) {
            console.log(`Error in fetch: ${error}`)
        }

    }


    let playerLength
    let playerList 

    if(game.players.length > 0){
        playerLength = game.players.length

        playerList = game.players.map((player)=>{
            return (
                <li key={player.username} className="players">{player.username}</li>
            )
        })
        
    }else{
        playerLength = 0
    }



    return (
        <div>
            <div className="page-items show-page sessions cell-border">
                <div className="center image-topper">
                <img src={game.image_url} alt={game.game_title}/>
                </div>
                <h2 className= "center">Game: {game.game_title} </h2>                
                <div className="row">

                <div className="columns large-6">

                <h2 className="sessions">Host: {game?.host?.username} </h2>
                <h3 className="sessions">Number of players: {playerLength}/{game.requested_number_of_players}  </h3>
                <p className="descriptions bottom-layer">Description: {game.description} </p>
                </div>
                <div className="columns large-6">

                <p className="descriptions">Team: </p>
                <ul>
                    {playerList}
                </ul>
                </div>
                </div>
                <button className="join button new-success join-border" onClick={postPlayer} >Join This Game</button>
            </div>

        </div>
    )
}

export default GamePostShowPage