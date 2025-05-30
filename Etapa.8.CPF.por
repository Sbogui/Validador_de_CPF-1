
def main():
    cpf_entrada = input("Digite o CPF(formato XXX.XXX.XXX-YY OU XXXXXXXXXYY): ")
    cpf_somente_numeros = ""
    numeros_cpf = ""
    digitos_verificadores = ""

    tamanho = len(cpf_entrada)

    if not ((tamanho == 14 and cpf_entrada[3] == "." and cpf_entrada[7] == "." and cpf_entrada[11] == "-") or (tamanho == 11)):
        print("Formato inválido. Encerrando programa.\n")
        return
    
    for i in range(tamanho):
        c = cpf_entrada[i]
        if '0' <= c <= '9':
            cpf_somente_numeros += c
    
    if len(cpf_somente_numeros) != 11:
        print("CPF inválido. Deve conter 11 dígitos numéricos.\n")
        return
    
    for i in range(9):
        numeros_cpf += cpf_somente_numeros[i]

    digitos_verificadores = cpf_somente_numeros[9] + cpf_somente_numeros[10]

    soma = 0 
    peso = 10 
    for i in range(9):
        soma += int(numeros_cpf[i]) * peso
        peso -= 1
    
    resto = soma % 11

    pdv_calculado = 0 if resto < 2 else 11 - resto

    print(f"\nCPF digitado: {cpf_entrada}")
    print(f"Primeiro Dígito Verificador Calculado: {pdv_calculado}")
    print(f"Primeiro Dígito verificador digitado: {digitos_verificadores[0]}")

    if pdv_calculado == int(digitos_verificadores[0]):
        print("\nResultado: O PDV está CORRETO.\n")
    else:
        print("\nResultado: O PDV está INCORRETO.\n")

    soma = 0 
    peso = 11
    for i in range(9):
        soma += int(numeros_cpf[i]) * peso
        peso -= 1
    soma += pdv_calculado * 2 

    resto = soma % 11
    sdv_calculado = 0 if resto < 2 else 11 - resto

    print(f"\nSegundo Dígito verificador calculado: {sdv_calculado}")
    print(f"Segundo Dígito verificador digitado: {digitos_verificadores[1]}")

    if sdv_calculado == int(digitos_verificadores[1]):
        print("\nResultado: O SDV está CORRETO.\n")
    else:
        print("\nResultado: O SDV está INCORRETO.\n")

    if pdv_calculado == int(digitos_verificadores[0]) and sdv_calculado == int(digitos_verificadores[1]):
        print(f"\nO CPF é VÁLIDO.\n")
    else:
        print(f"O CPF é INVÁLIDO.\n")

if __name__ == "__main__":
    main()
