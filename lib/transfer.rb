class Transfer
  # your code here

  attr_accessor :status

  attr_reader :sender, :receiver, :amount

  @@all = []

  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  #def execute_transaction
   # if @sender.balance < @amount
    #  @status = "rejected"
     # return "Transaction rejected. Please check your account balance."
    #elsif @status != "complete" && @sender.valid?
     # @receiver.balance = @receiver.balance + amount
      #@sender.balance = @sender.balance - amount
      #@status = "complete"
    #end
  #end

  def execute_transaction
    if self.valid? && @status == "pending" && sender.balance > @amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && receiver.balance > @amount && @status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end

end
