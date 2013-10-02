<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
	<title>{$title}&nbsp;{$config.suffix}</title>
	<base href="{$smarty.const.ESYN_URL}" />
	<meta charset="{$config.charset}">
	<meta name="description" content="{if isset($description) && !empty($description)}{$description|escape:"html"}{/if}" />
	<meta name="keywords" content="{if isset($keywords) && !empty($keywords)}{$keywords|escape:"html"}{/if}" />
	
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="HandheldFriendly" content="true">
	

	{if isset($category) && $category.id >= 0 && isset($listings)}
		<link rel="alternate" type="application/rss+xml" title="{$category.title|escape:"html"}" href="{$smarty.const.ESYN_URL}feed.php?from=category&amp;id={$category.id}&amp;start={$start}" />
	{/if}
	
	{if isset($view) && in_array($view, array('popular','new','top'))}
		<link rel="alternate" type="application/rss+xml" title="{$config.site|escape:"html"}" href="{$smarty.const.ESYN_URL}feed.php?from={$view}" />
	{/if}
	
	<link rel="shortcut icon" href="{$smarty.const.ESYN_URL}favicon.ico" />
	{include_file css="base, skeleton, layout, style" base="templates/TMPL/css/"}
	{if isset($css)}
		{include_file css=$css}
	{/if}
		
	{assign var="lang_file" value=$smarty.const.ESYN_TMP_NAME|cat:"/cache/intelli.lang."|cat:$config.lang}
	
	{include_file js="js/jquery/jquery, js/utils/sessvars, js/intelli/intelli, js/intelli/intelli.resize"}
	{include_file js=$smarty.const.ESYN_TMP_NAME|cat:"/cache/intelli.config"}
	{include_file js=$lang_file}
	
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	

	{if isset($js)}
		{include_file js=$js}
	{/if}

	{include_file js="js/intelli/intelli.minmax, js/intelli/intelli.thumbs, js/intelli/intelli.search, js/intelli/intelli.common, js/frontend/footer"}

	{if $manageMode}
		{include_file js="js/jquery/plugins/jquery.interface"}
		
		<style type="text/css">			
		{literal}
			div.groupWrapper
			{
				background-color:lightgreen;
				border:1px dotted whitesmoke;
			}
			.dropActive
			{
				padding:5px;
			}
			.dropHover
			{
				background: lightgreen;
				padding:0;
			}

		{/literal}
		</style>
	{/if}
	{esynHooker name="headSection"}
	<!--[if lt IE 7]>
	<script defer type="text/javascript" src="{$smarty.const.ESYN_URL}js/pngfix.js"></script>
	<![endif]-->

	<script type="text/javascript">
	{if isset($phpVariables)}{$phpVariables}{/if}
	intelli.lang = intelli.lang['{$config.lang}'];
	</script>
</head>
<body>
	<div class="header-block">
		<div class="container">
			<header id="header" class="clearfix">			
				<!-- logo start -->
				<div class="one-third column logo-block">
					<a href="{$smarty.const.ESYN_URL}">
						{if $config.site_logo neq ''}
							{print_img ups=true fl=$config.site_logo full="true" title=$config.site alt=$config.site}
						{else}
							{print_img fl="logo.png" full=true title=$config.site alt=$config.site}
						{/if}
					</a>
				</div>
				<!-- logo end -->
				
				<div class="one-third column">{$lang.slogan}</div>
				
				{if $config.language_switch}
				<!-- language switch start -->
				<div class="one-third column lang-switch-block">
					<form name="language_form" id="language_form" action="index.php" method="get">
					<label for="language_select">{$lang.language}:</label> 
					<select name="language" id="language_select">
						{foreach from=$languages key=code item=language name=select_lang}
							<option value="{$code}" {if $code eq $smarty.const.ESYN_LANGUAGE}selected="selected"{/if}>{$language}</option>
						{/foreach}
					</select>
					</form>
				</div>
				<!-- language switch end -->
				{/if}
			</header>
		</div>
	</div>	
	<div class="navigation-block">
		<div class="container">
			{include file="parse-blocks.tpl" pos=$blocks.mainmenu|default:null}
		</div>
	</div>	
	
	<div class="container clearfix" id="content">
			
		<div id="verytopBlocks" class="groupWrapper sixteen columns">
			{include file="parse-blocks.tpl" pos=$blocks.verytop|default:null}
		</div>
		
		<aside class="four columns alpha left-column">
			<div id="leftBlocks" class="groupWrapper">
				{include file="parse-blocks.tpl" pos=$blocks.left|default:null}
			</div>	
		</aside>
		
		<section class="eight columns center-column">
			<div class="groupWrapper">
				{if isset($breadcrumb)}
					{$breadcrumb}
				{/if}
				{esynHooker name="afterBreadcrumb"}
				{esynHooker name="beforeMainContent"}
				<div id="topBlocks" class="groupWrapper">
					{include file="parse-blocks.tpl" pos=$blocks.top|default:null}
				</div>
