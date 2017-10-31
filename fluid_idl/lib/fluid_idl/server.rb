module FluidIDL
  def least_and_greatest(xs)
    if xs.length == 0
      return nil
    return [min xs, max xs]
  end

  def default_limits
    {
      :variables => 50,
      :service_calls => 50,
      :lambdas => 10,
      :expressions => 100,
    }
  end

  def default_hooks
    Proc.new { |xtra| {
        :meta_middleware => lambda { |meta| meta },
        :sandbox_limits => lambda { |meta2| default_limits },
      }
    }
  end

  def empty_env
    { :parent => nil, :vars => Hash.new }
  end

  class Eval
    def initialize(config, env)
      @config = config
      @env = env
    end
    def run(query)
      return query["n"]
    end
  end
end
