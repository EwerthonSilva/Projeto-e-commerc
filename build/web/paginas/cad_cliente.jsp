<%-- 
    Document   : cad_cliente
    Created on : 20/05/2015, 12:04:38
    Author     : Thon
--%>

<div class="container">

    <form id="CadCliente" class="form-horizontal" method="post" action="CadCliente" data-ajax="1" data-saida-sucesso="#box_alertas" data-saida-erro="#box_alertas_cad_usuario">
        <fieldset>

            <!-- Form Name -->
            <legend>Digite seus Dados</legend>

            <div class="form-group">
                <label class="col-md-4 control-label" for="nome">Nome:</label>  
                <div class="col-md-4">
                    <input id="nome" name="nome" placeholder="Digite seu nome" class="form-control input-md" required="" type="text">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="email">E-Mail:</label>  
                <div class="col-md-4">
                    <input id="email" name="email" placeholder="Digite seu E-Mail" class="form-control input-md" required="" type="email">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="cpf">CPF:</label>  
                <div class="col-md-2">  
                    <input id="cpf" name="cpf" placeholder="Somente os numeros" class="form-control input-md" required="" type="text">

                </div>
            </div>

            <div class="form-group">

                <label class="col-md-4 control-label" for="endereco">Endereço:</label>  
                <div class="col-md-4">  
                    <input id="endereco" name="endereco" placeholder="Av./Rua/Logadouro..." class="form-control input-md" required="" type="text">
                </div>
            </div>

            <div class="form-group">            

                <label class="col-md-4 control-label" for="numero">Número:</label>  
                <div class="col-md-1">  
                    <input id="numero" name="numero" placeholder=" " maxlength="6" class="form-control input-md" required="" type="text">
                </div>
                <label class="col-md-1 control-label" for="cep">CEP:</label>  
                <div class="col-md-2">  
                    <input id="cep" name="cep" placeholder="Somente os numeros" class="form-control input-md" required="" type="text">

                </div>
            </div>


            <div class="form-group">   
                <label class=" col-md-4 control-label"  for="complemento">Complemento</label>  
                <div class="col-md-4">  
                    <input id="complemento" name="complemento" placeholder=" " class="form-control input-md" type="text">
                </div>

            </div>


            <div class="form-group">
                <label class="col-md-4 control-label" for="cidade">Cidade</label>  
                <div class="col-md-2">  
                    <input id="cidade" name="cidade" placeholder=" " class="form-control input-md" required="" type="text">
                </div>

            <div class="form-group">
                <label  class="col-md-1 control-label" for="uf">UF</label>  
                <div class="col-md-1">  
                    <select class="form-control" name="uf" title="Este campo é obrigatório" required >
                        <option value="">--</option>
                        <option value="AC">AC</option>
                        <option value="AL">AL</option>
                        <option value="AM">AM</option>
                        <option value="AP">AP</option>
                        <option value="BA">BA</option>
                        <option value="CE">CE</option>
                        <option value="DF">DF</option>
                        <option value="ES">ES</option>
                        <option value="GO">GO</option>
                        <option value="MA">MA</option>
                        <option value="MG">MG</option>
                        <option value="MS">MS</option>
                        <option value="MT">MT</option>
                        <option value="PA">PA</option>
                        <option value="PB">PB</option>
                        <option value="PE">PE</option>
                        <option value="PI">PI</option>
                        <option value="PR">PR</option>
                        <option value="RJ">RJ</option>
                        <option value="RN">RN</option>
                        <option value="RO">RO</option>
                        <option value="RR">RR</option>
                        <option value="RS">RS</option>
                        <option value="SC">SC</option>
                        <option value="SE">SE</option>
                        <option value="SP">SP</option>
                        <option value="TO">TO</option>
                    </select>
                </div>

            </div>
            <div class="form-group">
                <label class="col-md-4 col-xs-12 control-label" for="telefone">Telefone:</label>  
                <div class="col-xs-3 col-md-1">  
                    <input id="ddd" name="ddd" placeholder="DDD" class="form-control input-md "  required="" type="text">
                </div>
                <div class="col-xs-9 col-md-3">  
                    <input id="tel" name="tel" placeholder="Digite somente os numeros" class="form-control input-md"required="" type="text">
                </div>
            </div>

            <!-- Password input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="senha1">Senha:</label>
                <div class="col-md-4">
                    <input id="senha1" name="senha1" placeholder="Crie uma senha" class="form-control input-md" required="" type="password" pattern="^.{6,10}$" title="A senha deve possuir entre 6 e 10 dígitos" oninput="validaSenha(this, senha2)">

                </div>
            </div>

            <!-- Password input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="senha2">Repetição de Senha:</label>
                <div class="col-md-4">
                    <input id="senha2" name="senha2" placeholder="Repita sua senha" class="form-control input-md" required="" type="password" pattern="^.{6,10}$" title="A senha deve possuir entre 6 e 10 dígitos" oninput="validaSenha(senha1, this)">

                </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for=""></label>
                <div class="col-md-8">
                    <button id="" name="" class="btn btn-primary" type="submit">Enviar</button>
                </div>
            </div>

        </fieldset>
    </form>

    <script>
        jQuery(function ($) {
            $("#ddd").mask("(99)", {placeholder: "D"});
            $("#tel").mask("9999-9999", {placeholder: " "});
            $("#cpf").mask("999.999.999-99", {placeholder: " "});
            $("#cep").mask("99999-999", {placeholder: " "});
            //$("#numero").mask("9999", {placeholder: ""});
            $("#uf").mask("aa", {placeholder: " "});


        });
    </script>
</div>
