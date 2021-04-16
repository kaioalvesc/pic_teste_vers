[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- LOGO -->
<br />
<p align="center">
  <a href="https://github.com/kaioalvesc/pic_teste_vers">
    <img src="README/pic-logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Desafio - Machine Learning Platform Engineer</h3>
</p>



<!-- Indice  -->
<details open="open">
  <summary><h2 style="display: inline-block">Indice</h2></summary>
  <ol>
    <li>
      <a href="#Projeto">Projeto</a>
      <ul>
        <li><a href="#Tecnologias">Tecnologias</a></li>
      </ul>
    </li>
    <li>
      <a href="Execução">Execução</a>
      <ul>
        <li><a href="#Pré-requisitos">Pré Requisitos</a></li>
        <li><a href="#Instalação">Instalação</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Material de referencia</a></li>
  </ol>
</details>



<!-- Sobre o Projeto -->
## Projeto

 <a href="https://github.com/kaioalvesc/pic_teste_vers">
    <img src="README/arquitetura1.png" alt="arquitetura" width="800" height="280">
 </a>


O desafio consiste em implementar uma arquitetura completa que consome a Punk Api no
endpoint https://api.punkapi.com/v2/beers/random e ingere em um Kinesis
Stream que terá 2 consumidores.


### Tecnologias

* [Terraform](https://www.terraform.io/)
* [Python](https://www.python.org/)
* [AWS](https://aws.amazon.com/pt/)





<!-- Execução -->
## Execução

Para Conseguir executar a criação do ambiente vc deve ter o terraform instalado e um usuário IAM, e gerar uma chave secreta para o usuário

### Pré-requisitos

Segue a lista de acessos necessários para o usuário.
* IAM
  ```sh
  IAMFullAccess
  AmazonAthenaFullAccess
  AmazonKinesisFirehoseFullAccess
  AmazonKinesisFirehoseFullAccess
  CloudWatchEventsFullAccess
  AmazonS3FullAccess
  CloudWatchFullAccess
  AmazonAthenaFullAccess
  AWSGlueServiceRole
  AmazonKinesisFullAccess
  AWSLambda_FullAccess
  ```

### Instalação

1. Copiando Repositório
   ```sh
   git clone https://github.com/kaioalvesc/pic_teste_vers.git
   ```
2. Criar arquivo aws-keys.tfvars no diretório Base do Projeto
   ```sh
   access_key="SUA CHAVE DE ACESSO"
   secret_key="SUA CHAVE SECRETA"
   ```
3. Após isso executar o comando abaixo 
   ```sh
    terraform apply -var-file="aws-keys.tfvars" -auto-approve
   ```


<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/github_username/repo_name/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email

Project Link: [https://github.com/github_username/repo_name](https://github.com/github_username/repo_name)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[issues-shield]: https://img.shields.io/github/issues/github_username/repo.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/github_username
