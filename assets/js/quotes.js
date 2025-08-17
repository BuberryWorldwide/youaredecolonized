// Revolutionary Quotes Database
// Add new quotes here - they will automatically rotate on the homepage

const revolutionaryQuotes = [
    // Foundation quotes - core theory
    '"The master\'s tools will never dismantle the master\'s house. They may allow us temporarily to beat him at his own game, but they will never enable us to bring about genuine change." - Audre Lorde',
    
    '"If you have come here to help me, you are wasting your time. But if you have come because your liberation is bound up with mine, then let us work together." - Aboriginal activists, Queensland, 1970s',
    
    '"The revolution will not be funded." - INCITE!',
    
    // Charity critique
    '"Charity is a cold grey loveless thing. If a rich man wants to help the poor, he should pay his taxes gladly, not dole out money at a whim." - Clement Attlee',
    
    '"The white liberal is the worst enemy to America, and the worst enemy to the black man." - Malcolm X',
    
    // Power analysis
    '"The oppressed are allowed once every few years to decide which particular representatives of the oppressing class are to represent and repress them." - Karl Marx',
    
    '"Power concedes nothing without a demand. It never did and it never will." - Frederick Douglass',
    
    '"The most potent weapon in the hands of the oppressor is the mind of the oppressed." - Steve Biko',
    
    // Neutrality and complicity
    '"If you are neutral in situations of injustice, you have chosen the side of the oppressor." - Desmond Tutu',
    
    '"Washing one\'s hands of the conflict between the powerful and the powerless means to side with the powerful, not to be neutral." - Paulo Freire',
    
    // Revolutionary action
    '"The revolution is not an apple that falls when it is ripe. You have to make it fall." - Che Guevara',
    
    '"We who believe in freedom cannot rest until it comes." - Ella Baker',
    
    '"Nobody in the world, nobody in history, has ever gotten their freedom by appealing to the moral sense of the people who were oppressing them." - Assata Shakur',
    
    '"The system cannot be reformed, it must be overthrown." - John Africa',
    
    // Systems thinking
    '"The function, the very serious function of racism is distraction." - Toni Morrison',
    
    '"We are not going to be able to operate our Spaceship Earth successfully nor for much longer unless we see it as a whole spaceship and our fate as common. It has to be everybody or nobody." - Buckminster Fuller',
    
    // Strategy and extremism
    '"The question is not whether we will be extremists, but what kind of extremists we will be." - Martin Luther King Jr.',
    
    '"Optimism is a political act. Entrenched pessimism is, in its effect, if not in its intent, a tool of oppression." - Rebecca Solnit',
    
    // Class struggle
    '"When the people shall have nothing more to eat, they will eat the rich." - Jean-Jacques Rousseau',
    
    '"The real question is not whether machines think but whether men do." - B.F. Skinner',
    
    // Indigenous wisdom
    '"We do not inherit the earth from our ancestors; we borrow it from our children." - Native American Proverb',
    
    // Modern analysis
    '"Facebook is not a technology company. It\'s a surveillance company that happens to use technology." - Shoshana Zuboff',
    
    '"The purpose of a system is what it does." - Stafford Beer',
    
    '"Every billionaire is a policy failure." - Alexandria Ocasio-Cortez',
    
    // Organizing wisdom
    '"If you want to go fast, go alone. If you want to go far, go together." - African Proverb',
    
    '"Never doubt that a small group of thoughtful, committed citizens can change the world; indeed, it\'s the only thing that ever has." - Margaret Mead',
    
    // Economic critique
    '"It is easier to imagine the end of the world than the end of capitalism." - Mark Fisher',
    
    '"The master\'s house will never be dismantled by the master\'s tools, but it might be renovated." - Audre Lorde (Extended)',
    
    // Technology criticism
    '"The Internet is the largest experiment in anarchy that we have ever had." - Eric Schmidt',
    
    '"We\'re not customers of Facebook, we\'re the product." - Andrew Lewis',
    
    // Liberation theology
    '"When I give food to the poor, they call me a saint. When I ask why the poor have no food, they call me a communist." - Hélder Câmara',
    
    // Educational philosophy
    '"The important thing is not to stop questioning." - Albert Einstein',
    
    '"Education is the most powerful weapon which you can use to change the world." - Nelson Mandela',
    
    // Future vision
    '"Another world is possible." - World Social Forum',
    
    '"The most radical thing you can do is introduce people to one another." - Grace Lee Boggs',
    
    '"We are the ones we have been waiting for." - June Jordan',
    
    // Final call to action
    '"The revolution will be won by the people who show up." - Saul Alinsky'
];

// For external loading (if using separate file)
if (typeof module !== 'undefined' && module.exports) {
    module.exports = revolutionaryQuotes;
}

// For browser loading
if (typeof window !== 'undefined') {
    window.revolutionaryQuotes = revolutionaryQuotes;
}