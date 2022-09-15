import React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import GamePostShowPage from './GamePostShowPage'
import NewGamePage from './NewGamePage'


export const App = (props) => {
  return (
    <BrowserRouter>
    <Switch>
      <Route exact path="/game_posts/new" component={()=>{
        window.location.replace("/game_posts/new")
        return null
      }} />
      <Route exact path="/game_posts/:id" component={GamePostShowPage} />
      <Route exact path="/games/new" component={NewGamePage} />
    </Switch>
    </BrowserRouter>
  )
}

export default App