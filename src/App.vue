<template>
  <div>
    <div style="display: flex; justify-content:center; align-items: center; margin-top: 1%; margin-bottom: 1%">
      <img style="max-width:10%" src="./assets/pokeball.png">
      <h4 class="is-size-1" style="margin-left: 1%" >Pokédex</h4>
      <h4 class="is-size-7" style="margin-left: 1%" >2ª geração</h4>
      
    </div>
    <div  class="column is-half is-offset-one-quarter">
      <input class="input is-rounded" type="text" placeholder="Buscar pokémon pelo nome..." v-model="busca">
    </div>
    <div id="app" class="m-5">
      <div class="columns is-multiline">
          <div v-for="(poke) in searchResult" :key="poke.url" class="column is-4">
              <Pokemon :name="poke.name" :url="poke.url"/>
          </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Pokemon from './components/Pokemon'

export default {
  name: 'App',
  data(){
    return {
      pokemons: [],
      busca: ''
    }
  },
  created: function(){
    axios.get('https://pokeapi.co/api/v2/pokemon?limit=100&offset=151').then(res => {
      //console.log(res.data.results);
      this.pokemons = res.data.results;
    })
  },
  components:{
    Pokemon
  },
  computed: {
    searchResult: function(){
      if (this.busca == '') {
        return this.pokemons;
      }
      else {
        return this.pokemons.filter(pokemon => pokemon.name.toLowerCase().includes(this.busca.toLowerCase()));
      }
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
