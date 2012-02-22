# -*- encoding : utf-8 -*-
class MembersController < ApplicationController
  USER_ACTIONS = [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, except: USER_ACTIONS
  before_filter :authenticate_member!, only: USER_ACTIONS


  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end


  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end



  # GET /members/new
  # GET /members/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /members
  # POST /members.json
  def create
    count = Member.mass_invite!(params["MassInvite"]["emails"])
    respond_to do |format|
      format.html { redirect_to new_member_path, notice: "Yaay! Totalt #{count} invitasjoner ble sendt." }
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

end