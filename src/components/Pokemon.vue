<template>
    <div>
        <h1> </h1>
<!--        <small>{{ url }}</small> -->

        <div class="card">
        <div class="card-image">
            
            <figure >
            <img :src="currentImg" alt="Placeholder image">
            </figure>
            <button class="button is-fullwidth" @click="changeSprite">{{ btnSpriteLabel }}</button>
        </div>
        <div class="card-content">
            <div class="media">
            <div class="media-content">
                <p class="title is-4">{{ pokemon.id }} - {{ name | upper }}</p>
                <div class="columns">
                    <div v-for="(type) in pokemon.types" :key="type.slot" class="column is-gapless">
                        <img style="height: 45px;" :src="getTypePicture(type.type.name)"/>
                    </div>
                </div>
            </div>
            </div>

            <div class="content">
                <p>Peso: {{ pokemon.weight/10 }} Kg</p>
            </div>
        </div>
        </div>

    </div>
</template>

<script>


import axios from 'axios';
export default {
    created: function(){
        axios.get(this.url).then(res => {
            this.pokemon.id = res.data.id;
            this.pokemon.types = res.data.types;
            this.pokemon.front_sprite = res.data.sprites.front_default;
            this.pokemon.back_sprite = res.data.sprites.back_default;
            this.currentImg = this.pokemon.front_sprite;
            this.btnSpriteLabel = 'Costas';
            this.pokemon.weight = res.data.weight;
        })
    },
    data(){
        return {
            isFront: true,
            currentImg: '',
            btnSpriteLabel: '',
            pokemon: {
                id: '',
                types: '',
                front_sprite: '',
                back_sprite: '',
                weight: '',
            }
        }
    },
    props: {
        name: String,
        url: String
    },
    filters: {
        upper: function(value){
            var newName = value[0].toUpperCase() + value.slice(1);
            return newName;
        }
    },
    methods: {
        getTypePicture(type) {
            switch (type) {
                case 'bug':
                    return require(`../assets/pokemon-types/type_BUG.png`);
                case 'dark':
                    return require(`../assets/pokemon-types/type_DARK.png`);
                case 'dragon':
                    return require(`../assets/pokemon-types/type_DRAGON.png`);
                case 'electric':
                    return require(`../assets/pokemon-types/type_ELECTRIC.png`);
                case 'fairy':
                    return require(`../assets/pokemon-types/type_FAIRY.png`);
                case 'fighting':
                    return require(`../assets/pokemon-types/type_FIGHTING.png`);
                case 'fire':
                    return require(`../assets/pokemon-types/type_FIRE.png`);
                case 'flying':
                    return require(`../assets/pokemon-types/type_FLYING.png`);
                case 'ghost':
                    return require(`../assets/pokemon-types/type_GHOST.png`);
                case 'grass':
                    return require(`../assets/pokemon-types/type_GRASS.png`);
                case 'ground':
                    return require(`../assets/pokemon-types/type_GROUND.png`);
                case 'ice':
                    return require(`../assets/pokemon-types/type_ICE.png`);
                case 'normal':
                    return require(`../assets/pokemon-types/type_NORMAL.png`);
                case 'poison':
                    return require(`../assets/pokemon-types/type_POISON.png`);
                case 'psychic':
                    return require(`../assets/pokemon-types/type_PSYCHIC.png`);
                case 'rock':
                    return require(`../assets/pokemon-types/type_ROCK.png`);
                case 'steel':
                    return require(`../assets/pokemon-types/type_STEEL.png`);
                case 'water':
                    return require(`../assets/pokemon-types/type_WATER.png`);                                                                                                                        
                default:
                    return require(`../assets/pokemon-types/type_.png`);
                
            }
        },
        changeSprite: function(){
            if (this.isFront){
                this.isFront = false;
                this.currentImg = this.pokemon.back_sprite;
                this.btnSpriteLabel = 'Frente';
            } 
            else{
                this.isFront = true;
                this.currentImg = this.pokemon.front_sprite;
                this.btnSpriteLabel = 'Costas';
            }
        }
    }
}
</script>

<style>

</style>