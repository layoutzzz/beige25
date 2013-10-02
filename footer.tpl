			</div>
			<!-- verybottom block -->
			<div id="verybottomBlocks" class="groupWrapper">
				{include file="parse-blocks.tpl" pos=$blocks.verybottom|default:null}
			</div>
			<!-- verybottom block -->
		</section>
		<aside class="four columns omega">
			<div id="rightBlocks" class="groupWrapper">
				{include file="parse-blocks.tpl" pos=$blocks.right|default:null}
			</div>
		</aside>
		<div class="clear"></div>
		<footer id="footer">
			{esynHooker name="beforeFooterLinks"}
			{include file="parse-blocks.tpl" pos=$blocks.copyright|default:null}
			{esynHooker name="afterFooterLinks"}			
			<div class="designby"> Design by <a href="http://www.layoutzzz.com">layoutzzz</a></div>
		</footer>
</div>
<!-- main page end -->

<noscript>
	<div class="js_notification">{$lang.error_javascript}</div>
</noscript>

{print_img full=true fl="ajax-loader.gif" id="spinner" style="display:none;"}

<!-- thumbs preview start -->
<div class="thumb">
	<div class="loading" style="display: none;">{print_img fl="spinner.gif" full=true class="spinner"}</div>
</div>
<!-- thumbs preview end -->

{esynHooker name="footerBeforeIncludeJs"}

{if $manageMode}
	<div id="mod_box" class="mode">
		{$lang.youre_in_manage_mode}. <a href="?switchToNormalMode=y" style="font-weight: bold; color: #FFF;">{$lang.exit}</a>
	</div>
	{include_file js="js/frontend/visual-mode"}
{/if}

{if isset($smarty.get.preview) || isset($smarty.session.preview)}
	<div id="mod_box" class="mode">
		{$lang.youre_in_preview_mode} <a href="?switchToNormalMode=y" style="font-weight: bold; color: #FFF;">{$lang.exit}</a>
	</div>
{/if}
{if $config.cron}<div style="display:none"><img src="cron.php" width="1" height="1" alt="" /></div>{/if}

{esynHooker name="beforeCloseTag"}

{include_file js="script" base="templates/TMPL/js/"}
</body>
</html>
