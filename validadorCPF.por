programa {
  inclua biblioteca Texto

  funcao inicio() {
    cadeia cpf_entrada = "", cpf_somente_numeros, numeros_CPF = "", digitos_verificadores = ""
    caracter c
    inteiro i, tamanho

    escreva("Digite o CPF (com ou sem pontuação): ")
    leia(cpf_entrada)

    tamanho = Texto.numero_caracteres(cpf_entrada)

    para(i = 0; i < tamanho; i = i + 1) {
      c = Texto.obter_caracter(cpf_entrada, i)

      se (c >= "0" e c <= "9") {
        cpf_somente_numeros = cpf_somente_numeros + c
      }
    }

    se (Texto.numero_caracteres(cpf_somente_numeros) == 11) {
      para(i = 0; i < 9; i = i + 1) {
        numeros_CPF = numeros_CPF + Texto.obter_caracter(cpf_somente_numeros, i)
      }

      digitos_verificadores = Texto.obter_caracter(cpf_somente_numeros, 9) + Texto.obter_caracter(cpf_somente_numeros, 10)

      escreva("Números do CPF: ", numeros_CPF, "\n")
      escreva("Dígitos Verificadores: ", digitos_verificadores, "\n")
    } 
    senao {
      escreva("CPF inválido. Deve conter 11 dígitos numéricos.\n")
    }
  }
}
