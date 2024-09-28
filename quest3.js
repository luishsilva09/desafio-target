//Questão 3

console.log("Questão 3")
//Solucao 1
function quest3() {
    const fat = [6, 3, 7, 34, 67, 0, 0]
    let menor_valor = Number.POSITIVE_INFINITY
    let maior_valor = Number.NEGATIVE_INFINITY
    let total = 0

    for (let i = 0; i < fat.length; i++) {
        total += fat[i]
        //Menor valor
        if (fat[i] < menor_valor && fat[i] != 0) menor_valor = fat[i]
        //maior valor
        if (fat[i] > maior_valor && fat[i] != 0) maior_valor = fat[i]
        //media
    }

    let media = total / fat.filter(e => e > 0).length
    let res = fat.filter(e => e > media).length

    console.log(`Menor valor: ${menor_valor}\nMaior valor: ${maior_valor} \nQuantidade de dias maior que media: ${res}\nmedia: ${media}`)
}

function quest3_2() {

}

quest3()