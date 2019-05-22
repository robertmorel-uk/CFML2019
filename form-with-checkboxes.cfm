<cfoutput>
	<cfset contactContent = $.getBean('content').loadBy(fileName='pick-pack-quote') />
	<!-- Main -->
	<div class="container">
	<div class="row">
		<div class="col-lg-12">
			</div>
		</div>
	</div>
	<!-- Form -->
	<div class="mt-3 mb-3 pt-3 pb-3">
		<div class="container newWhite">
			<div class="row">
				<div class="col-lg-12">
					<p>
						Fields marked with a <sup>*</sup> are mandatory.
					</p>
					<div class="row">
						<div class="col-md-10">
							<form>
								
								<div class="form-group row">
									<label for="FullName" class="col-sm-12 col-form-label">
										Name <sup>*</sup>
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="FullName" name="FullName" placeholder="" required="required">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Company" class="col-sm-12 col-form-label">
										Company <sup>*</sup>
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="Company" name="Company" placeholder="">
									</div>
								</div>	
								
								<div class="form-group row">
									<label for="Telephone" class="col-sm-12 col-form-label">
										Telephone <sup>*</sup>
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="Telephone" name="Telephone" placeholder="" required="required">
									</div>
								</div>	
								
								<div class="form-group row">
									<label for="Email" class="col-sm-12 col-form-label">
										Email <sup>*</sup>
									</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="Email" name="Email" placeholder="" required="required">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Website" class="col-sm-12 col-form-label">
										Website
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="Website" name="Website" placeholder="">
									</div>
								</div>	
								
								<div class="form-group row">
								  	<label for="Referrer" class="col-sm-12 col-form-label">
									  	Where did you hear about us?
									</label>
								<div class="col-sm-10">
								  <select class="form-control" id="Referrer" name="Referrer">
									<option>Recommendation</option>
									<option>Google</option>
									<option>Blog</option>
									<option>Paid Advert</option>
									<option>Social</option>
									<option>Other</option>
								  </select>
								</div></div>
								
								<div class="form-group row">
									<label for="businessNature" class="col-sm-12">
										<b>1.</b> What is the nature of your business and the range of products you provide? <sup>*</sup>
									</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="businessNature" name="businessNature" placeholder="" rows="3"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label for="Logistics" class="col-sm-12 col-form-label">
									  	<b>2.</b> How do you manage your logistics currently? <sup>*</sup>
									</label>
									<div class="col-10 col-sm-6 qms-checkbox-btn">
									  <label class="form-check-label" for="inHouse">
										<input type="checkbox" class="form-check-input" id="inHouse" name="inHouse" value="inHouse">
										  In house
									  </label>
									</div>
									<div class="col-10 col-sm-6 qms-checkbox-btn">
									  <label class="form-check-label" for="thirdParty">
										<input type="checkbox" class="form-check-input" id="thirdParty" name="thirdParty" value="thirdParty">
										  Third Party
									  </label>
									</div>
									<div class="col-10 col-sm-6 qms-checkbox-btn">
									  <label class="form-check-label" for="newBusiness">
										<input type="checkbox" class="form-check-input" id="newBusiness" name="newBusiness" value="newBusiness">
										  This is a new business
									  </label>
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Logistics" class="col-sm-12 col-form-label">
									  	<b>3.</b> What channels do you use to sell your product info?
									</label>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="retail">
											<input type="checkbox" class="form-check-input" id="retail" name="retail" value="retail">
											  Retail
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="consumer">
											<input type="checkbox" class="form-check-input" id="consumer" name="consumer" value="consumer">
											  Consumer
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="wholesale">
											<input type="checkbox" class="form-check-input" id="wholesale" name="wholesale" value="wholesale">
											  Wholesale
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="educational">
											<input type="checkbox" class="form-check-input" id="educational" name="educational" value="educational">
											  Educational
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="hospitality">
											<input type="checkbox" class="form-check-input" id="hospitality" name="hospitality" value="hospitality">
											  Hospitality
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="replenishment">
											<input type="checkbox" class="form-check-input" id="replenishment" name="replenishment" value="replenishment">
											  Own store replenishment
										  </label>
										</div>
								</div>
								
								<div class="form-group row">
									<label for="Website" class="col-sm-12 col-form-label">
										<b>4.</b> Number of orders per month? If this is a new business please provide estimates.
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="numOrdersPerMonth" name="numOrdersPerMonth" placeholder="">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Website" class="col-sm-12 col-form-label">
										<b>5.</b> Number of items per order?
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="numItemsPerOrder" name="numItemsPerOrder" placeholder="">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Website" class="col-sm-12 col-form-label">
										<b>6.</b> What is the average order value?
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="aveOrderVal" name="aveOrderVal" placeholder="">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="businessNature" class="col-sm-12">
										<b>7.</b> Will the product require special packing, kitting, labelling or any other special rework? If yes, please give details. <sup>*</sup>
									</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="packagingReq" name="packagingReq" placeholder="" rows="3"></textarea>
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Website" class="col-sm-12 col-form-label">
										<b>8.</b> How many different products do you store? Example 1 product = T-shirt/Size XL
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="productRange" name="productRange" placeholder="">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Logistics" class="col-sm-12 col-form-label">
									  	<b>9.</b> How will your products arrive?
									</label>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="pallet">
											<input type="checkbox" class="form-check-input" id="pallet" name="pallet" value="pallet">
											  Pallet
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="box">
											<input type="checkbox" class="form-check-input" id="box" name="box" value="box">
											  Box
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="container">
											<input type="checkbox" class="form-check-input" id="container" name="container" value="container">
											  Container
										  </label>
										</div>
								</div>
								
								<div class="form-group row">
									<label for="Website" class="col-sm-12 col-form-label">
										<b>10.</b> How many pallets / boxes on average do you store?
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="numBoxesStored" name="numBoxesStored" placeholder="">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="Logistics" class="col-sm-12 col-form-label">
									  	<b>11.</b> Please select any special storage and handling requirements you may have?
									</label>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="highValue">
											<input type="checkbox" class="form-check-input" id="highValue" name="highValue" value="highValue">
											  High value
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="hazardous">
											<input type="checkbox" class="form-check-input" id="hazardous" name="hazardous" value="hazardous">
											  Hazardous
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="perishable">
											<input type="checkbox" class="form-check-input" id="perishable" name="perishable" value="perishable">
											  Perishable
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="tempSensitive">
											<input type="checkbox" class="form-check-input" id="tempSensitive" name="tempSensitive" value="tempSensitive">
											  Temperature sensitive
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="oversized">
											<input type="checkbox" class="form-check-input" id="oversized" name="oversized" value="oversized">
											  Oversized
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="fragile">
											<input type="checkbox" class="form-check-input" id="fragile" name="fragile" value="fragile">
											  Fragile
										  </label>
										</div>
										<div class="col-10 col-sm-6 qms-checkbox-btn">
										  <label class="form-check-label" for="medical">
											<input type="checkbox" class="form-check-input" id="medical" name="medical" value="medical">
											  Medical
										  </label>
										</div>
								</div>
								
								<div class="form-group row">
									<label for="businessNature" class="col-sm-12">
										<b>12.</b> Please add anything else you would like us to know.
									</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="addInfo" name="addInfo" placeholder="" rows="3"></textarea>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-2">
										&nbsp;
									</label>		
									<div class="col-sm-10">						
										#variables.$.dspObject_Include(thefile='form/dsp_form_protect.cfm')#
									</div>
								</div>
								<div class="float-right mt-3">
									<button type="submit" class="btn btn-primary float-right">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Form -->
</cfoutput>