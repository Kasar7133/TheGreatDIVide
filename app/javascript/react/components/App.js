import React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import GamePostNew from './GamePostNew'
import GamePostShowPage from './GamePostShowPage'
import NewGamePage from './NewGamePage'


export const App = (props) => {
  return (
    <BrowserRouter>
    <Switch>
      <Route exact path="/game_posts/new" component={GamePostNew} />
      <Route exact path="/game_posts/:id" component={GamePostShowPage} />
      <Route exact path="/games/new" component={NewGamePage} />
    </Switch>
    </BrowserRouter>
  )
}

export default App