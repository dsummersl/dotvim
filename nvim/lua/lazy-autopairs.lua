return function ()
  return {
    "windwp/nvim-autopairs",
    -- later versions have broken the ability to hit 'enter' within (_).
    -- commit = "0f04d78619cce9a5af4f355968040f7d675854a1",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }
end
