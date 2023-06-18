# centro_estudantil_BD
projecto final de Base de dados 2



Projecto Nº 1: Controlo da docência num centro estudantil.

Num centro estudantil da cidade de Luanda, se deseja automatizar o controlo dos resultados docentes obtidos pelos seus alunos, assim como a actualização da matrícula e outras informações necessárias para o melhor controlo da actividade docente.

As saídas que se desejam obter com este sistema automatizado são:

1.	Lista dos alunos por grupo

Nesta saída devem aparecer as seguintes informações:
•	Período escolar (Exemplo: 2021/22)
•	Classe
•	Número do grupo (Pode repetir-se para classes diferentes, mas é único em uma mesma classe)
 
E, para cada aluno, por número de ordem (que se atribui por ordem alfabético dos apelidos):
•	Número da lista
•	Nomes e apelidos
•	Código do aluno

2.	Lista das disciplinas leccionadas em cada classe

Nesta saída devem aparecer as seguintes informações
•	Período escolar
•	Classe

E para cada disciplina:
•	Nome da disciplina

3.	Lista das avaliações por grupo em cada disciplina
 
Nesta saída devem aparecer as seguintes informações:
•	Período escolar
•	Classe
•	Número do grupo 
•	Nome da disciplina
 
E, para cada aluno, por número de lista:
•	Número de ordem
•	Nomes e apelidos
•	Avaliações obtida nessa disciplina (aprovado, desaprovado)

4.	Lista das médias finais obtidas pelos alunos em cada classe.
 
Nesta saída se deseja obter as seguintes informações (anual e acumulado):
•	Período que se reporta (trimestral, semestral ou anual)
•	Período escolar
•	Classe 
•	Número do grupo
E, para cada aluno, por número de ordem:
•	Número da lista
•	Nomes e apelidos
•	Media obtida

5.	Lista por ponderado

Nesta saída se deseja obter por grupo e para toda a classe as seguintes informações:

•	Período escolar
•	Classe
•	Número do grupo (deseja-se para um só grupo; se é para toda a classe, não aparece)

E, para cada aluno, segundo a ordem de mérito:
•	Número da lista de mérito
•	Nomes e apelidos
•	Média acumulada 
•	Número da lista
•	Sexo
 

6.	Lista dos reprovados por grupo em cada disciplina

A informação que deve conter esta saída é:
•	Período escolar
•	Classe
•	Número do grupo 
•	Nome da disciplina

E, para cada aluno reprovado, de acordo ao número da lista:
•	Número da lista
•	Nomes e apelidos
•	Nota obtida

7.	Lista dos alunos Reprovados por grupo

•	Período escolar
•	Classe 
•	Número do grupo 
E, para cada estudante do grupo:
•	Número de ordem
•	Lista das disciplinas reprovadas

8.	Lista, por grupo, dos alunos que causaram baixa

Nesta lista deve conter:
•	Período escolar
•	Classe
•	Número do grupo
E, para cada aluno que causa baixa, ordenados por número da lista:
•	Número da lista
•	Nomes e apelidos
•	Causa da baixa

9.	Lista dos repetentes por grupo
 
Deve conter a seguinte informação:
•	Período
•	Classe
•	Número do grupo
E, para cada aluno repetente, por número da lista:
•	Número da lista
•	Nomes e apelidos
 
Considerações para o desenho do sistema:

•	Deve ter-se em conta que varias disciplinas leccionadas em diferentes classes podem ter o mesmo nome, por exemplo a disciplina Matemática se da em todas as classes.

•	Um grupo está identificado pela classe e o seu número.

•	Um aluno pode causar baixa por diferentes causas (doença, transferência, culminação dos estudos, etc.) mas uma delas é se reprova por segunda vez uma classe, para a qual basta com que reprove duas disciplinas. Neste caso, o aluno causa baixa automaticamente, o qual é controlado pelo sistema. A informação dos alunos que causam baixa só deve eliminar-se a pedido do usuário ou ao iniciar o novo ano lectivo.

•	Assim mesmo, é necessário permitir que se possa modificar a nota aprovadora que indica que um aluno está apto ou não apto.

•	Ao termo de cada período escolar deverá executar-se um processo que garanta a situação académica dos estudantes:

	Serão promovidos para a classe imediata superior, aqueles que tenham aprovado TODAS as disciplinadas da classe correspondente.

	Serão considerados repetentes de uma classe, os alunos que tiverem uma ou mais disciplinas reprovadas na mesma classe.

	Serão dados como baixa aqueles que, entre outros motivos já mencionados, reprovem pela segunda vez na mesma classe.

•	Se deverá controlar o número de vagas disponíveis para o ano seguinte. Para tal, o sistema deverá dar informação específica sobre se permite ou não matricular a novos alunos.


Integrantes: 4 estudantes



