<?php
$this->load->model('order/order_model');
$this->load->model('batch/batch_model');
?>
<html>
<head>
<style type="text/css">
.strong { font-weight:bold;}
.center { text-align:center;}
.clear { clear:both; }
.red { color: #ff0000; } 
.block { display: block; } 
.inline-block { display: inline-block; } 
#si { width:825px;}
#top-space { height:100px; width:100% }
#name-date { height:45px; width:100%;margin-top:10px; }
.name { float:right;width:540px;text-align:left;margin-top:22px; }
.datetime { float:right; width:130px;margin-top:15px; }
#location-si_num { height:35px; width:100%; }
.location { float:right;width:540px;text-align:left;margin-top:2px; }
.si_num { float:right; width:130px;margin-top: -1px; }
#medrep{ height:35px; width:100%; }
.medrep_name { margin-left:245px;width:235px;margin-top:10px; }
#mid-space { height: 20px; width:100% }
.small-space { height:17px; width:100% }
#items_p1 { width:100%;height:15px;}
#items_p2 { width:100%;height:18px;}
#items_end { width:100%;height:22px;}
.description { width:270px;display:inline-block;margin-left:60px; }
.spacer_1 { width:49px;display:inline-block;}
.lot_num { width:60px;display:inline-block;}
.expiry { width:69px;display:inline-block;}
.qty { width:55px;display:inline-block;}
.price { width:64px;display:inline-block;}
.total { width:110px;display:inline-block;}
.end_text { width:260px;display:inline-block;}
#discount { width:100%;height:22px;}
.discount_text { width:135px;float:right; }
.discount_val { width:65px;float:right; }
.discount_result { width:110px;float:right; }
#total { width:100%;}
.total_text { width:110px;margin:right:20px;float:right;margin-top: 15px;}
#printThis { width:100px;margin:0 auto; }
body { font: 12pt Georgia, "Times New Roman", Times, serif; line-height: 1.3; }
.noPrint { width:825px; }
@media print {
.strong { font-weight:bold;}
.center { text-align:center;}
.clear { clear:both; }
.red { color: #ff0000; } 
.block { display: block; } 
#si { width:825px;}
#top-space { height:100px; width:100% }
#name-date { height:45px; width:100%;margin-top:10px; }
.name { float:right;width:540px;text-align:left;margin-top:22px; }
.datetime { float:right; width:130px;margin-top:15px; }
#location-si_num { height:35px; width:100%; }
.location { float:right;width:540px;text-align:left;margin-top:2px; }
.si_num { float:right; width:130px;margin-top: -1px; }
#medrep{ height:35px; width:100%; }
.medrep_name { margin-left:245px;width:235px; margin-top:10px;}
#mid-space { height: 20px; width:100% }
.small-space { height:17px; width:100% }
#items_p1 { width:100%;height:15px;}
#items_p2 { width:100%;height:18px;}
#items_end { width:100%;height:22px;}
.description { width:270px;display:inline-block;margin-left:60px; }
.spacer_1 { width:49px;display:inline-block;}
.lot_num { width:60px;display:inline-block;}
.expiry { width:69px;display:inline-block;}
.qty { width:55px;display:inline-block;}
.price { width:64px;display:inline-block;}
.total { width:110px;display:inline-block;}
.end_text { width:260px;display:inline-block;}
#discount { width:100%;height:22px;}
.discount_text { width:135px;float:right; }
.discount_val { width:65px;float:right; }
.discount_result { width:110px;float:right; }
#total { width:100%;}
.total_text { width:110px;margin:right:20px;float:right;margin-top: 15px;}
#printThis { width:100px;margin:0 auto; }
body { font: 12pt Georgia, "Times New Roman", Times, serif; line-height: 1.3; }
.noPrint { width:825px;display:none; }
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/script.js"></script>
</head>
<body>
	<?php
	$msr_id = get_msr_client($order_info[0]->msr_client_id);
	$client_id = get_msr_client($order_info[0]->msr_client_id,'client_id');
	?>
	<div id="si">
		<div id="top-space">&nbsp;</div>
		<div id="name-date">
			<div class="datetime center"><?=date('M d,Y',strtotime($order_info[0]->order_date))?></div>
			<div class="name strong"><?=get_name($client_id);?></div>
		</div>
		<div id="location-si_num">
			<div class="si_num strong center"><?=$order_info[0]->form_number;?></div>
			<div class="location"><?=get_address($msr_id);?></div>
		</div>
		<div id="medrep">
			<div class="medrep_name center"><?=get_name($msr_id);?></div>
		</div>
		<div id="mid-space">&nbsp;</div>
		<?php if(isset($paid_items) && !empty($paid_items)) : ?>
			<?php $full_amount = 0; ?>
			<?php foreach($paid_items as $item) : ?>
				<?php
					$batch = $this->batch_model->get_single($item->batch_id);
					$order = $this->order_model->get_single($item->order_id);
					$price = ($item->custom_price != null?$item->custom_price:$batch->sell);
				?>
			<div class="item_holder">
				<div id="items_p1">
					<div class="description strong center"><?=get_item_name($batch->item_id,true);?></div>
					<div class="spacer_1">&nbsp;</div>
					<div class="lot_num"><?=$batch->lot_number;?></div>
					<div class="expiry"><?=date('m/y',strtotime($batch->expire_date));?></div>
					<div class="qty"><?=$item->quantity;?></div>
					<div class="price"><?=$price;?></div>
					<div class="total"><?php $total = $price * $item->quantity; $full_amount += $total; echo $total; ?></div>
				</div>
				<div class="clear"></div>
				<div id="items_p2">
					<div class="description center"><?=get_item_desc($batch->item_id);?></div>
					<div class="spacer_1">&nbsp;</div>
					<div class="lot_num">&nbsp;</div>
					<div class="expiry">&nbsp;</div>
					<div class="qty">&nbsp;</div>
					<div class="price">&nbsp;</div>
					<div class="total">&nbsp;</div>
				</div>
			</div>
			<?php endforeach; ?>
		<?php endif; ?>
		<?php if(isset($free_items) && !empty($free_items)) : ?>
			<br/>
			<div class="description center">Free Items</div>
			<div id="items_p2">
				<div class="spacer_1">&nbsp;</div>
				<div class="lot_num">&nbsp;</div>
				<div class="expiry">&nbsp;</div>
				<div class="qty">&nbsp;</div>
				<div class="price">&nbsp;</div>
				<div class="total">&nbsp;</div>
			</div>
			<?php foreach($free_items as $item) : ?>
				<?php
					$batch = $this->batch_model->get_single($item->batch_id);
					$order = $this->order_model->get_single($item->order_id);
					$price = ($item->custom_price != null?$item->custom_price:$batch->sell);
				?>
			<div class="item_holder">	
				<div id="items_p1">
					<div class="description strong center"><?=get_item_name($batch->item_id,true);?></div>
					<div class="spacer_1">&nbsp;</div>
					<div class="lot_num"><?=$batch->lot_number;?></div>
					<div class="expiry"><?=date('m/y',strtotime($batch->expire_date));?></div>
					<div class="qty"><?=$item->quantity;?></div>
					<div class="price"></div>
					<div class="total"></div>
				</div>
				<div class="clear"></div>
				<div id="items_p2">
					<div class="description center"><?=get_item_desc($batch->item_id);?></div>
					<div class="spacer_1">&nbsp;</div>
					<div class="lot_num">&nbsp;</div>
					<div class="expiry">&nbsp;</div>
					<div class="qty">&nbsp;</div>
					<div class="price">&nbsp;</div>
					<div class="total">&nbsp;</div>
				</div>
			</div>
			<?php endforeach; ?>
		<?php endif; ?>
		<div id="items_end">
			<div class="description">&nbsp;</div>
			<div class="spacer_1">&nbsp;</div>
			<div class="end_text strong center">*****nothing follows*****</div>
			<div class="total"><?=$full_amount;?></div>
		</div>
		<div id="mid-space">&nbsp;</div>
		<?php if($order->discount_type == 'percentage'): ?>
		<div id="discount">
			<div class="discount_result">(<?php $less = $full_amount * ($order->discount/100); echo $less?>)</div>
			<div class="discount_val">(<?=$order->discount;?>%)</div>
			<div class="discount_text strong">Less Dsicount</div>
		</div>
		<?php else : ?>
		<div id="discount">
			<div class="discount_result">(10000)</div>
			<div class="discount_val">(88%)</div>
			<div class="discount_text strong">Less Discount</div>
		</div>
		<?php endif; ?>
		<div class="small-space">&nbsp;</div>
		<div id="total">
			<div class="total_text strong">P <?=number_format($full_amount - $less,2) ;?></div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="noPrint center block">
		<input class="inline-block" type="button" id='printThis' value="PRINT" onClick="window.print();"/>
		<input class="inline-block" type="button" id='downloadThis' value="DOWNLOAD" onClick=""/>
		<span class="center red block">**please set margin as none on printing options</span>
	</div>
</body>
</html>