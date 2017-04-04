import React from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import styled from 'styled-components'

import PokemonPreview from '../components/PokemonPreview'
import AddPokemonPreview from '../components/AddPokemonPreview'

const Title = styled.div`
  color: #7F7F7F;
  font-size: 32px;
  font-weight: 300;
`

class Pokedex extends React.Component {

  static propTypes = {
    data: React.PropTypes.shape({
      loading: React.PropTypes.bool,
      error: React.PropTypes.object,
      Trainer: React.PropTypes.object,
    }).isRequired,
  }

  render () {
    if (this.props.data.loading) {
      return (<div>Loading</div>)
    }

    if (this.props.data.error) {
      console.log(this.props.data.error)
      return (<div>An unexpected error occurred</div>)
    }

    console.log(this.props.data);

    return (
      <div className='w-100 bg-light-gray min-vh-100'>
        <Title className='tc pa5'>
          Hey {this.props.data.Trainer.name}, there are {this.props.data.Trainer.pokemons.length} Pokemons in your pokedex
        </Title>
        <div className='flex flex-wrap justify-center center w-75'>
          <AddPokemonPreview trainerId={this.props.data.Trainer.id} />
          {this.props.data.Trainer.pokemons.map((pokemon) =>
            <PokemonPreview key={pokemon.id} pokemon={pokemon} />
          )}
        </div>
      </div>
    )
  }
}

const TrainerQuery = gql`query TrainerQuery($name: String!) {
  Trainer(name: $name) {
    id
    name
    pokemons {
      id
      name
      url
    }
  }
}`

const PokedexWithData = graphql(TrainerQuery, {
  options: {
    variables: {
      name: 'Rachel Minto'
    },
    forceFetch: true,
  }
}
)(Pokedex)

export default PokedexWithData
