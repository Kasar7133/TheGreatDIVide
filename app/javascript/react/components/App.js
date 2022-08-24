import React from 'react'
import { BrowserRouter, Route } from 'react-router-dom'
import GamePostShowPage from './GamePostShowPage'


export const App = (props) => {
  return (
    <BrowserRouter>
      <Route exact path="/game_posts/:id" component={GamePostShowPage} />
    </BrowserRouter>
  )
}

export default App