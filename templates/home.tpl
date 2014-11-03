<div class="row home" itemscope itemtype="http://www.schema.org/ItemList">
	<div class="col-md-3 col-sm-6 col-md-offset-1">
		<ul class="cucina-list">
			<!-- BEGIN categories -->
			<li class="horiz-highlight">
				<!-- IF categories.link -->
				<a href="{categories.link}" itemprop="url" target="_blank">
				<!-- ELSE -->
				<a href="{relative_path}/category/{categories.slug}" itemprop="url">
				<!-- ENDIF categories.link -->
					<h2>{categories.name}</h2>
					<p>{categories.description}</p>
					<ul class="meta">
						<li><i class="fa {categories.icon}"></i></li>
						<!-- IF !categories.link -->
						<li>{categories.topic_count} topics</li>
						<li>{categories.post_count} posts</li>
						<!-- ELSE -->
						<li>External Link</li>
						<!-- ENDIF !categories.link -->
					</ul>
				</a>
			</li>
			<!-- END categories -->
		</ul>
	</div>
</div>