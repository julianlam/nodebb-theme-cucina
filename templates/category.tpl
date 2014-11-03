
<input type="hidden" template-variable="category_id" value="{cid}" />
<input type="hidden" template-variable="category_name" value="{name}" />
<input type="hidden" template-variable="topic_count" value="{topic_count}" />
<input type="hidden" template-variable="currentPage" value="{currentPage}" />
<input type="hidden" template-variable="pageCount" value="{pageCount}" />

<ol class="breadcrumb">
	<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
		<a href="{relative_path}/" itemprop="url"><span itemprop="title">[[global:home]]</span></a>
	</li>
	<!-- IF parent -->
	<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
		<a href="{relative_path}/category/{parent.slug}" itemprop="url"><span itemprop="title">{parent.name}</span></a>
	</li>
	<!-- ENDIF parent -->
	<li class="active" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
		<span itemprop="title">{name} <!-- IF !feeds:disableRSS --><a target="_blank" href="{relative_path}/category/{cid}.rss"><i class="fa fa-rss-square"></i></a><!-- ENDIF !feeds:disableRSS --></span>
	</li>
</ol>

<div class="subcategories">
	<!-- BEGIN children -->
	<!-- IMPORT partials/category_child.tpl -->
	<!-- END children -->
</div>

<div class="category row">
	<div class="col-md-8 col-sm-12 col-md-offset-1" no-widget-class="col-md-11 col-sm-12 col-md-offset-1" no-widget-target="sidebar">

		<div class="header category-tools clearfix">
			<!-- IF privileges.topics:create -->
			<button id="new_post" class="btn btn-primary">[[category:new_topic_button]]</button>
			<!-- ENDIF privileges.topics:create -->

			<span class="pull-right">
				<!-- IF loggedIn -->
				<button type="button" class="btn btn-default btn-success watch <!-- IF !isIgnored -->hidden<!-- ENDIF !isIgnored -->"><i class="fa fa-eye"></i> [[topic:watch]]</button>
				<button type="button" class="btn btn-default btn-warning ignore <!-- IF isIgnored -->hidden<!-- ENDIF isIgnored -->"><i class="fa fa-eye-slash"></i> [[category:ignore]]</button>
				<!-- ENDIF loggedIn -->

				<!-- IMPORT partials/category_tools.tpl -->

				<div class="dropdown share-dropdown inline-block">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						[[topic:share]] <span class="caret"></span>
					</button>

					<!-- IMPORT partials/share_dropdown.tpl -->
				</div>
			</span>

		</div>

		<!-- IF !topics.length -->
		<div class="alert alert-warning" id="category-no-topics">
			[[category:no_topics]]
		</div>
		<!-- ENDIF !topics.length -->

		<ul class="cucina-list" id="topics-container" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}">
			<meta itemprop="itemListOrder" content="descending">
			<!-- BEGIN topics -->
			<li>
				<a href="{relative_path}/topic/{topics.slug}" itemprop="url">
					<h2>{topics.title}</h2>
					<ul class="meta">
						<li><i class="fa fa-info"></i> <i class="fa fa-thumb-tack<!-- IF !topics.pinned --> hide<!-- ENDIF !topics.pinned -->"></i> <i class="fa fa-lock<!-- IF !topics.locked --> hide<!-- ENDIF !topics.locked -->"></i></li>
						<li>{topics.postcount} [[global:posts]]</li>
						<li>{topics.viewcount} [[global:views]]</li>
						<li>[[global:posted_ago, <span class="timeago" title="{topics.relativeTime}"></span>]]</li>
						<li>
							<!-- IF topics.unreplied -->
							[[category:no_replies]]
							<!-- ELSE -->
							<a href="<!-- IF topics.teaser.user.userslug -->{relative_path}/user/{topics.teaser.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.teaser.user.userslug -->">
								{topics.teaser.user.username}
							</a>
							<a href="{relative_path}/topic/{topics.slug}/{topics.teaser.index}">
								[[global:replied_ago, <span class="timeago" title="{topics.teaser.timestamp}"></span>]]
							</a>
							<!-- ENDIF topics.unreplied -->
						</li>
					</ul>
				</a>
			</li>
			<!-- END topics -->
		</ul>
		<!-- IF config.usePagination -->
		<div class="text-center">
			<ul class="pagination">
				<li class="previous pull-left"><a href="#"><i class="fa fa-chevron-left"></i> [[global:previouspage]]</a></li>
				<li class="next pull-right"><a href="#">[[global:nextpage]] <i class="fa fa-chevron-right"></i></a></li>
			</ul>
		</div>
		<!-- ENDIF config.usePagination -->
	</div>

	<!-- IF topics.length -->
	<div widget-area="sidebar" class="col-md-3 col-xs-12 category-sidebar"></div>
	<!-- ENDIF topics.length -->

	<span class="hidden" id="csrf" data-csrf="{csrf}"></span>
</div>

<!-- IMPORT partials/move_thread_modal.tpl -->
<!-- IMPORT partials/noscript/paginator.tpl -->